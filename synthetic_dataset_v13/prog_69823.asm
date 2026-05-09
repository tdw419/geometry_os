; DESCRIPTION: Composite: Creates a black rectangular region at (267, 15) spanning 113 by 44 pixels then Places a green dot at position (165, 58) then Renders a magenta line between points (263, 47) and (362, 169).
; PLAN: r0=267(x), r1=15(y), r2=113(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x), r6=58(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=263(x1), r11=47(y1), r12=362(x2), r13=169(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 15
LDI r2, 113
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 58
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 263
LDI r11, 47
LDI r12, 362
LDI r13, 169
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
