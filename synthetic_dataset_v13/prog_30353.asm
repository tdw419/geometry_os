; DESCRIPTION: Renders a cyan box of size 104x21 starting at (230, 219).
; PLAN: r0=230(x), r1=219(y), r2=104(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 219
LDI r2, 104
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
