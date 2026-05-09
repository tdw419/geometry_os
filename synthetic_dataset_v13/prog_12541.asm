; DESCRIPTION: Composite: Creates a cyan rectangular region at (281, 116) spanning 46 by 14 pixels then Draws a red circle centered at (138, 72) with radius 42 then Draws a cyan line from (394, 46) to (455, 223).
; PLAN: r0=281(x), r1=116(y), r2=46(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x), r6=72(y), r7=42(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=394(x1), r11=46(y1), r12=455(x2), r13=223(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 116
LDI r2, 46
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 72
LDI r7, 42
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 394
LDI r11, 46
LDI r12, 455
LDI r13, 223
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
