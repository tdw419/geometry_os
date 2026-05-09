; DESCRIPTION: Renders a cyan box of size 95x20 starting at (325, 204).
; PLAN: r0=325(x), r1=204(y), r2=95(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 204
LDI r2, 95
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
