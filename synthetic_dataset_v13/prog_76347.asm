; DESCRIPTION: Renders a cyan box of size 72x29 starting at (123, 109).
; PLAN: r0=123(x), r1=109(y), r2=72(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 109
LDI r2, 72
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
