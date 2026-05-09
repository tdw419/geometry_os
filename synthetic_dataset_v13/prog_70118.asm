; DESCRIPTION: Renders a red box of size 52x42 starting at (398, 20).
; PLAN: r0=398(x), r1=20(y), r2=52(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 20
LDI r2, 52
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
