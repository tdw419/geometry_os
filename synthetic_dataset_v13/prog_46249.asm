; DESCRIPTION: Renders a red box of size 21x30 starting at (262, 215).
; PLAN: r0=262(x), r1=215(y), r2=21(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 215
LDI r2, 21
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
