; DESCRIPTION: Renders a cyan box of size 104x106 starting at (239, 83).
; PLAN: r0=239(x), r1=83(y), r2=104(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 83
LDI r2, 104
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
