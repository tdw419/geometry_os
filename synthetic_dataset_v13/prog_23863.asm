; DESCRIPTION: Composite: Creates a blue rectangular region at (245, 168) spanning 53 by 55 pixels then Places a black dot at position (220, 90) then Renders a green line between points (385, 213) and (109, 210).
; PLAN: r0=245(x), r1=168(y), r2=53(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x), r6=90(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=385(x1), r11=213(y1), r12=109(x2), r13=210(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 168
LDI r2, 53
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 90
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 385
LDI r11, 213
LDI r12, 109
LDI r13, 210
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
