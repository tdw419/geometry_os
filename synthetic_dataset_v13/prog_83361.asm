; DESCRIPTION: Composite: Renders a cyan disk with center (466, 112) and radius 32 then Places a red 85x47 rectangle at position (299, 58).
; PLAN: r0=466(x), r1=112(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x), r6=58(y), r7=85(width), r8=47(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 466
LDI r1, 112
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 58
LDI r7, 85
LDI r8, 47
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
