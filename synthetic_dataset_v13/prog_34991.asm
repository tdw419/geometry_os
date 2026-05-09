; DESCRIPTION: Places a red 29x91 rectangle at position (404, 111).
; PLAN: r0=404(x), r1=111(y), r2=29(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 111
LDI r2, 29
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
