; DESCRIPTION: Renders a cyan box of size 104x61 starting at (176, 43).
; PLAN: r0=176(x), r1=43(y), r2=104(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 43
LDI r2, 104
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
