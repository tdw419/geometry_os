; DESCRIPTION: Composite: Places a black 83x42 rectangle at position (348, 210) then Draws a yellow line from (329, 154) to (401, 251) then Sets a single orange pixel at (168, 215).
; PLAN: r0=348(x), r1=210(y), r2=83(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x1), r6=154(y1), r7=401(x2), r8=251(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=168(x), r11=215(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 348
LDI r1, 210
LDI r2, 83
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 154
LDI r7, 401
LDI r8, 251
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 215
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
