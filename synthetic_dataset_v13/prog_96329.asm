; DESCRIPTION: Places a green 20x28 rectangle at position (275, 91).
; PLAN: r0=275(x), r1=91(y), r2=20(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 91
LDI r2, 20
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
