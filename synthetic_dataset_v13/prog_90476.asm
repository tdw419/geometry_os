; DESCRIPTION: Renders a cyan box of size 16x116 starting at (404, 42).
; PLAN: r0=404(x), r1=42(y), r2=16(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 42
LDI r2, 16
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
