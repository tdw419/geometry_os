; DESCRIPTION: Composite: Renders a white disk with center (196, 66) and radius 47 then Places a white 35x98 rectangle at position (328, 133) then Draws a white line from (503, 30) to (479, 53).
; PLAN: r0=196(x), r1=66(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=328(x), r6=133(y), r7=35(width), r8=98(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=503(x1), r11=30(y1), r12=479(x2), r13=53(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 66
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 328
LDI r6, 133
LDI r7, 35
LDI r8, 98
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 503
LDI r11, 30
LDI r12, 479
LDI r13, 53
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
