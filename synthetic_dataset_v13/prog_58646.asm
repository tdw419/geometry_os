; DESCRIPTION: Composite: Draws a green line from (168, 242) to (410, 244) then Draws a purple rectangle at (197, 92) with width 50 and height 87.
; PLAN: r0=168(x1), r1=242(y1), r2=410(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=92(y), r7=50(width), r8=87(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 242
LDI r2, 410
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 92
LDI r7, 50
LDI r8, 87
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
