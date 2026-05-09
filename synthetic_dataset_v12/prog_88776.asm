; DESCRIPTION: Places a cyan 63x120 rectangle at position (209, 91).
; PLAN: r0=209(x), r1=91(y), r2=63(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 91
LDI r2, 63
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
