; DESCRIPTION: Composite: Draws a orange rectangle at (146, 44) with width 88 and height 45 then Places a blue dot at position (384, 194) then Draws a cyan line from (213, 93) to (246, 69).
; PLAN: r0=146(x), r1=44(y), r2=88(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x), r6=194(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=213(x1), r11=93(y1), r12=246(x2), r13=69(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 44
LDI r2, 88
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 194
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 213
LDI r11, 93
LDI r12, 246
LDI r13, 69
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
