; DESCRIPTION: Composite: Draws a cyan line from (205, 112) to (57, 213) then Renders a white box of size 108x111 starting at (269, 67) then Sets a single magenta pixel at (138, 235).
; PLAN: r0=205(x1), r1=112(y1), r2=57(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=67(y), r7=108(width), r8=111(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=138(x), r11=235(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 205
LDI r1, 112
LDI r2, 57
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 67
LDI r7, 108
LDI r8, 111
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 138
LDI r11, 235
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
