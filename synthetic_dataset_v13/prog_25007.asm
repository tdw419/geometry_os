; DESCRIPTION: Renders a black box of size 22x31 starting at (218, 113).
; PLAN: r0=218(x), r1=113(y), r2=22(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 113
LDI r2, 22
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
