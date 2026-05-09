; DESCRIPTION: Composite: Places a cyan line segment connecting (146, 226) to (63, 242) then Renders a white box of size 50x23 starting at (336, 16).
; PLAN: r0=146(x1), r1=226(y1), r2=63(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=16(y), r7=50(width), r8=23(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 226
LDI r2, 63
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 16
LDI r7, 50
LDI r8, 23
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
