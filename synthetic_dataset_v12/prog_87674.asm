; DESCRIPTION: Composite: Places a yellow line segment connecting (265, 42) to (360, 59) then Places a black 48x50 rectangle at position (143, 93) then Places a white dot at position (346, 9).
; PLAN: r0=265(x1), r1=42(y1), r2=360(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=93(y), r7=48(width), r8=50(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x), r11=9(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 265
LDI r1, 42
LDI r2, 360
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 93
LDI r7, 48
LDI r8, 50
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 9
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
