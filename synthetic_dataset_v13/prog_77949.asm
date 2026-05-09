; DESCRIPTION: Composite: Creates a red circular shape at (400, 103) with radius 75 then Draws a cyan line from (287, 195) to (261, 0) then Renders a orange box of size 48x10 starting at (181, 120).
; PLAN: r0=400(x), r1=103(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=287(x1), r6=195(y1), r7=261(x2), r8=0(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=181(x), r11=120(y), r12=48(width), r13=10(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 103
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 287
LDI r6, 195
LDI r7, 261
LDI r8, 0
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 181
LDI r11, 120
LDI r12, 48
LDI r13, 10
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
