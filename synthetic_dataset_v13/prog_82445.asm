; DESCRIPTION: Composite: Draws a cyan circle centered at (320, 107) with radius 56 then Renders a white line between points (394, 127) and (415, 10) then Creates a cyan rectangular region at (428, 149) spanning 29 by 72 pixels.
; PLAN: r0=320(x), r1=107(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=394(x1), r6=127(y1), r7=415(x2), r8=10(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=428(x), r11=149(y), r12=29(width), r13=72(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 107
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 394
LDI r6, 127
LDI r7, 415
LDI r8, 10
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 149
LDI r12, 29
LDI r13, 72
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
