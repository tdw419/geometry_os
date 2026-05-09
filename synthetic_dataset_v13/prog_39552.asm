; DESCRIPTION: Renders a cyan box of size 72x85 starting at (186, 19).
; PLAN: r0=186(x), r1=19(y), r2=72(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 19
LDI r2, 72
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
