; DESCRIPTION: Places a cyan 120x40 rectangle at position (275, 91).
; PLAN: r0=275(x), r1=91(y), r2=120(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 91
LDI r2, 120
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
