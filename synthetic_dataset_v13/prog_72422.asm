; DESCRIPTION: Composite: Sets a single yellow pixel at (108, 156) then Renders a black line between points (386, 36) and (256, 228) then Renders a magenta box of size 63x64 starting at (305, 64).
; PLAN: r0=108(x), r1=156(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=386(x1), r6=36(y1), r7=256(x2), r8=228(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=305(x), r11=64(y), r12=63(width), r13=64(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 156
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 386
LDI r6, 36
LDI r7, 256
LDI r8, 228
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 64
LDI r12, 63
LDI r13, 64
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
