; DESCRIPTION: Draws a red rectangle at (92, 228) with width 104 and height 12.
; PLAN: r0=92(x), r1=228(y), r2=104(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 228
LDI r2, 104
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
