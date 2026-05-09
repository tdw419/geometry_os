; DESCRIPTION: Composite: Draws a red line from (320, 240) to (168, 196) then Places a orange circle of radius 59 at center (154, 83).
; PLAN: r0=320(x1), r1=240(y1), r2=168(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=83(y), r7=59(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 320
LDI r1, 240
LDI r2, 168
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 83
LDI r7, 59
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
