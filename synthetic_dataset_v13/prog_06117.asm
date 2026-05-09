; DESCRIPTION: Draws a red rectangle at (401, 190) with width 48 and height 14.
; PLAN: r0=401(x), r1=190(y), r2=48(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 190
LDI r2, 48
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
