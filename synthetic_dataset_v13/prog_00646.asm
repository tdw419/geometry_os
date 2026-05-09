; DESCRIPTION: Composite: Places a red 39x13 rectangle at position (224, 215) then Renders a purple line between points (225, 73) and (10, 24).
; PLAN: r0=224(x), r1=215(y), r2=39(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x1), r6=73(y1), r7=10(x2), r8=24(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 215
LDI r2, 39
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 73
LDI r7, 10
LDI r8, 24
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
