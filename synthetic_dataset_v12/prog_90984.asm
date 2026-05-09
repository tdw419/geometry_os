; DESCRIPTION: Renders a cyan box of size 15x39 starting at (263, 96).
; PLAN: r0=263(x), r1=96(y), r2=15(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 96
LDI r2, 15
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
