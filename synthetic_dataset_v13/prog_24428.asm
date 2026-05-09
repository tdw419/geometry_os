; DESCRIPTION: Renders a cyan box of size 80x35 starting at (387, 78).
; PLAN: r0=387(x), r1=78(y), r2=80(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 78
LDI r2, 80
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
