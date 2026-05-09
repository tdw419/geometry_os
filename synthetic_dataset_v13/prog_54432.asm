; DESCRIPTION: Composite: Places a cyan dot at position (404, 205) then Draws a yellow circle centered at (262, 80) with radius 36 then Renders a magenta box of size 101x85 starting at (305, 86).
; PLAN: r0=404(x), r1=205(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=262(x), r6=80(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=305(x), r11=86(y), r12=101(width), r13=85(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 205
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 262
LDI r6, 80
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 305
LDI r11, 86
LDI r12, 101
LDI r13, 85
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
