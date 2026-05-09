; DESCRIPTION: Composite: Places a yellow 106x16 rectangle at position (301, 146) then Sets a single green pixel at (308, 213).
; PLAN: r0=301(x), r1=146(y), r2=106(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x), r6=213(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 146
LDI r2, 106
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 213
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
