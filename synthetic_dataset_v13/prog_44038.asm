; DESCRIPTION: Composite: Renders a purple disk with center (255, 52) and radius 48 then Draws a blue line from (439, 34) to (103, 203) then Places a blue 73x71 rectangle at position (267, 14).
; PLAN: r0=255(x), r1=52(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x1), r6=34(y1), r7=103(x2), r8=203(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=267(x), r11=14(y), r12=73(width), r13=71(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 52
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 34
LDI r7, 103
LDI r8, 203
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 14
LDI r12, 73
LDI r13, 71
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
