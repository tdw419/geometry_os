; DESCRIPTION: Renders a cyan box of size 95x77 starting at (112, 128).
; PLAN: r0=112(x), r1=128(y), r2=95(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 128
LDI r2, 95
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
