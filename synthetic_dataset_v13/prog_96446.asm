; DESCRIPTION: Composite: Places a red dot at position (116, 135) then Renders a cyan box of size 67x38 starting at (55, 54).
; PLAN: r0=116(x), r1=135(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=55(x), r6=54(y), r7=67(width), r8=38(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 135
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 55
LDI r6, 54
LDI r7, 67
LDI r8, 38
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
