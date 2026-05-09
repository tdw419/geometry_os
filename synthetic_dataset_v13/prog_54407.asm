; DESCRIPTION: Renders a red box of size 90x90 starting at (401, 120).
; PLAN: r0=401(x), r1=120(y), r2=90(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 120
LDI r2, 90
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
