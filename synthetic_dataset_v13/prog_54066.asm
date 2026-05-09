; DESCRIPTION: Places a green 84x71 rectangle at position (275, 60).
; PLAN: r0=275(x), r1=60(y), r2=84(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 60
LDI r2, 84
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
