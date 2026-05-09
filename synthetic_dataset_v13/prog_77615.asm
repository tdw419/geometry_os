; DESCRIPTION: Composite: Places a white dot at position (256, 223) then Creates a magenta rectangular region at (330, 182) spanning 107 by 60 pixels then Places a magenta circle of radius 42 at center (445, 199).
; PLAN: r0=256(x), r1=223(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=330(x), r6=182(y), r7=107(width), r8=60(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=445(x), r11=199(y), r12=42(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 256
LDI r1, 223
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 330
LDI r6, 182
LDI r7, 107
LDI r8, 60
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 199
LDI r12, 42
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
