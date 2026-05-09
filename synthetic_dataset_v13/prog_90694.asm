; DESCRIPTION: Composite: Renders a cyan box of size 16x61 starting at (238, 181) then Draws a green line from (281, 82) to (219, 126).
; PLAN: r0=238(x), r1=181(y), r2=16(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x1), r6=82(y1), r7=219(x2), r8=126(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 181
LDI r2, 16
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 82
LDI r7, 219
LDI r8, 126
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
