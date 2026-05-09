; DESCRIPTION: Renders a red box of size 112x59 starting at (242, 27).
; PLAN: r0=242(x), r1=27(y), r2=112(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 27
LDI r2, 112
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
