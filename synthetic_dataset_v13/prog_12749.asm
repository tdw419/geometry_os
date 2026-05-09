; DESCRIPTION: Composite: Renders a cyan box of size 50x40 starting at (284, 30) then Sets a single white pixel at (495, 193) then Renders a green line between points (245, 37) and (447, 21).
; PLAN: r0=284(x), r1=30(y), r2=50(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x), r6=193(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=245(x1), r11=37(y1), r12=447(x2), r13=21(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 30
LDI r2, 50
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 193
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 245
LDI r11, 37
LDI r12, 447
LDI r13, 21
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
