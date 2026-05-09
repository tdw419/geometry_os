; DESCRIPTION: Renders a cyan box of size 72x37 starting at (212, 152).
; PLAN: r0=212(x), r1=152(y), r2=72(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 152
LDI r2, 72
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
