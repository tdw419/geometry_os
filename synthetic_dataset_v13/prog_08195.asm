; DESCRIPTION: Renders a cyan box of size 112x66 starting at (277, 126).
; PLAN: r0=277(x), r1=126(y), r2=112(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 126
LDI r2, 112
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
