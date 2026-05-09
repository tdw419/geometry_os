; DESCRIPTION: Renders a red box of size 36x92 starting at (242, 126).
; PLAN: r0=242(x), r1=126(y), r2=36(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 126
LDI r2, 36
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
