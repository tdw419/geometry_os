; DESCRIPTION: Composite: Places a red dot at position (180, 116) then Renders a white box of size 117x120 starting at (269, 53).
; PLAN: r0=180(x), r1=116(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=53(y), r7=117(width), r8=120(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 116
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 269
LDI r6, 53
LDI r7, 117
LDI r8, 120
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
