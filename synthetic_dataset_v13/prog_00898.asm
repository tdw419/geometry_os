; DESCRIPTION: Composite: Renders a purple line between points (356, 182) and (82, 28) then Renders a cyan box of size 64x18 starting at (211, 113).
; PLAN: r0=356(x1), r1=182(y1), r2=82(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=113(y), r7=64(width), r8=18(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 182
LDI r2, 82
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 113
LDI r7, 64
LDI r8, 18
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
