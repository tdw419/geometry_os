; DESCRIPTION: Renders a red box of size 104x14 starting at (231, 94).
; PLAN: r0=231(x), r1=94(y), r2=104(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 94
LDI r2, 104
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
