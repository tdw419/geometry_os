; DESCRIPTION: Composite: Sets a single green pixel at (464, 215) then Creates a cyan rectangular region at (419, 143) spanning 85 by 86 pixels then Places a magenta circle of radius 79 at center (242, 79).
; PLAN: r0=464(x), r1=215(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=419(x), r6=143(y), r7=85(width), r8=86(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=242(x), r11=79(y), r12=79(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 215
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 419
LDI r6, 143
LDI r7, 85
LDI r8, 86
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 79
LDI r12, 79
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
