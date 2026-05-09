; DESCRIPTION: Renders a cyan box of size 79x61 starting at (321, 95).
; PLAN: r0=321(x), r1=95(y), r2=79(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 95
LDI r2, 79
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
