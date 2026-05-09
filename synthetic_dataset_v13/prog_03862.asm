; DESCRIPTION: Composite: Places a yellow dot at position (503, 115) then Draws a white rectangle at (210, 67) with width 61 and height 75.
; PLAN: r0=503(x), r1=115(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=67(y), r7=61(width), r8=75(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 503
LDI r1, 115
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 210
LDI r6, 67
LDI r7, 61
LDI r8, 75
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
