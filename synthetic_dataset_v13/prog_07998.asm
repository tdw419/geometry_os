; DESCRIPTION: Composite: Draws a white rectangle at (301, 39) with width 44 and height 24 then Places a blue dot at position (293, 38) then Renders a magenta line between points (354, 214) and (387, 128).
; PLAN: r0=301(x), r1=39(y), r2=44(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x), r6=38(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=354(x1), r11=214(y1), r12=387(x2), r13=128(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 39
LDI r2, 44
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 38
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 354
LDI r11, 214
LDI r12, 387
LDI r13, 128
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
