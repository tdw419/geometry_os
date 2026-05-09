; DESCRIPTION: Composite: Draws a red rectangle at (243, 83) with width 111 and height 46 then Renders a blue line between points (271, 215) and (234, 230).
; PLAN: r0=243(x), r1=83(y), r2=111(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x1), r6=215(y1), r7=234(x2), r8=230(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 83
LDI r2, 111
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 215
LDI r7, 234
LDI r8, 230
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
