; DESCRIPTION: Composite: Creates a red rectangular region at (317, 129) spanning 72 by 53 pixels then Places a yellow dot at position (346, 205).
; PLAN: r0=317(x), r1=129(y), r2=72(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x), r6=205(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 317
LDI r1, 129
LDI r2, 72
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 205
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
